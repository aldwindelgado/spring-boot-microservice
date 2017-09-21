package com.github.aldwindelgado.resource;

import com.netflix.hystrix.contrib.javanica.annotation.HystrixCommand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
public class HelloResource {

    @Autowired
    private RestTemplate restTemplate;

    @RequestMapping(
            value = "/rest/hello/sample",
            method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE
    )
    public ResponseEntity<String> sampleGet() {
        return new ResponseEntity<>("{\"message\":\"Greetings! This is from client!\"}", HttpStatus.OK);
    }

    @HystrixCommand(fallbackMethod = "fallBackResourceCall")
    @RequestMapping(
            value = "/rest/hello",
            method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE
    )
    public ResponseEntity<String> sampleResourceCall() {
        String url = "http://hello-server/rest/hello";
        return new ResponseEntity<>(restTemplate.getForObject(url, String.class), HttpStatus.OK);
    }

    public ResponseEntity<String> fallBackResourceCall() {
        return new ResponseEntity<>("{\"message\":\"Hystrix is good to go!\"}", HttpStatus.OK);
    }
}
