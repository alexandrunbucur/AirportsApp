package com.airportsapp.controller;

import com.airportsapp.reports.ReportTop;
import com.airportsapp.dao.AirportDao;
import com.airportsapp.dao.CountryDao;
import com.airportsapp.dao.RunwayDao;
import com.airportsapp.model.Airport;
import com.airportsapp.model.Country;
import com.airportsapp.model.Runway;
import com.airportsapp.reports.CommonRunwayId;
import com.airportsapp.reports.CountryRunwayTypes;
import com.airportsapp.reports.CountrySearchResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Controller
public class HomeController {
    private String query;
    private String search;


    @Autowired
    private AirportDao airportDao;

    @Autowired
    private CountryDao countryDao;

    @Autowired
    private RunwayDao runwayDao;

    @RequestMapping("/")
    public String home() {
        return "home";
    }

    @RequestMapping("/query")
    public String query() {
        return "query";
    }


    @RequestMapping(value = "/query", method = RequestMethod.POST)
    public String query(@RequestParam("text1") String username) {
        search = username;
        System.out.print(username);
        return "redirect:/queryResult";
    }

    @RequestMapping("/queryResult")
    public String queryResult(Model model) {

        List<Country> countries = countryDao.getAllCountries();
        List<Airport> airports = airportDao.getAllAirports();
        List<Runway> runways = runwayDao.getAllRunways();
        List<Airport> resultAirports = new ArrayList<>();
        String searchCode = "";
        String searchCountry = "";

        for (Country country : countries)
            if (country.getName().toUpperCase().startsWith(search.toUpperCase()) || country.getCode().equalsIgnoreCase(search)) {
                searchCode = country.getCode();
                searchCountry = country.getName();
                break;
            }

        List<CountrySearchResult> countrySearchResults = new ArrayList<>();
        generateRunwaysByCountry(airports, runways, searchCode, countrySearchResults);

        model.addAttribute("countrySearchResults", countrySearchResults);
        model.addAttribute("searchCountry", searchCountry);

        return "queryResult";
    }

    public void generateRunwaysByCountry(List<Airport> airports, List<Runway> runways, String searchCode, List<CountrySearchResult> countrySearchResults) {
        String airportRunways;
        for (Airport airport : airports) {
            airportRunways = "";
            if (airport.getIso_country().equalsIgnoreCase(searchCode)) {
                for (Runway runway : runways) {
                    if (airport.getIdent().equalsIgnoreCase(runway.getAirport_ident()))

                        airportRunways += runway.getId() + " - ";
                }
                countrySearchResults.add(new CountrySearchResult(airport.getName(), airportRunways));
            }
        }
    }


    @RequestMapping("/reports")
    public String reports(Model model) throws SQLException, ClassNotFoundException {

        List<Airport> airports = airportDao.getAllAirports();
        List<Country> countries = countryDao.getAllCountries();
        List<ReportTop> reportTops = new ArrayList<ReportTop>();
        generateTopReport(airports, countries, reportTops);

        List<ReportTop> listTop = reportTops.subList(0, 10);
        List<ReportTop> listBottom = reportTops.subList(reportTops.size() - 10, reportTops.size());
        model.addAttribute("listTop", listTop);
        model.addAttribute("listBottom", listBottom);

        List<Runway> runways = runwayDao.getAllRunways();
        List<CountryRunwayTypes> countryRunwayTypes = new ArrayList<CountryRunwayTypes>();
        generateCountryRunwayTypes(countries, runways, countryRunwayTypes);
        model.addAttribute("countryRunwayTypes", countryRunwayTypes);


        List<CommonRunwayId> commonRunwayIds = new ArrayList<>();
        generateRunwayIdList(commonRunwayIds);
        model.addAttribute("commonRunwayIds", commonRunwayIds);


        return "reports";
    }

    public void generateCountryRunwayTypes(List<Country> countries, List<Runway> runways, List<CountryRunwayTypes> countryRunwayTypes) {
        String str = " ";
        for (Country country : countries) {
            str = " ";
            for (Runway runway : runways) {
                System.out.print(runway.getSurface());
                if (runway.getSurface() != null)
                    if (!str.contains(runway.getSurface()))
                        if (runway.getAirport_ident().startsWith(country.getCode())) {
                            str += runway.getSurface() + " ,";
                        }
            }

            countryRunwayTypes.add(new CountryRunwayTypes(country.getName(), str));
        }
    }

    public void generateTopReport(List<Airport> airports, List<Country> countries, List<ReportTop> reportTops) {
        int count;
        for (Country country : countries) {
            count = 0;
            for (Airport airport : airports)
                if (airport.getIso_country().equalsIgnoreCase(country.getCode()))
                    count++;
            reportTops.add(new ReportTop(country.getName(), count));
        }

        Collections.sort(reportTops);
    }

    public void generateRunwayIdList(List<CommonRunwayId> commonRunwayIds) throws SQLException {
        query = "select top 10 le_ident, count(*) as number from runway\n" +
                "group by le_ident\n" +
                "order by number desc";
        ResultSet resultSet = connectToAndQueryDatabase(query);
        while (resultSet.next()) {
            String string = resultSet.getString("le_ident");
            int i = resultSet.getInt("number");

            //Assuming you have a user object
            CommonRunwayId ci = new CommonRunwayId(string, i);
            commonRunwayIds.add(ci);
            System.out.print(ci.getCount());
        }
        Collections.sort(commonRunwayIds);
        for (CommonRunwayId commonRunwayId : commonRunwayIds
                ) {
            System.out.println(commonRunwayId.getRunwayId() + "  " + commonRunwayId.getCount());

        }
    }

    public ResultSet connectToAndQueryDatabase(String query) throws SQLException {

        Connection con = null;
        ResultSet results;

        try {
            Class.forName("org.h2.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        con = DriverManager.getConnection("jdbc:h2:tcp://localhost/~/luna", "sa", "");
        PreparedStatement statement = con.prepareStatement(query);
        results = statement.executeQuery();
        return results;


    }


}
