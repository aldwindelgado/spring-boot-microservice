package com.github.aldwindelgado.resource;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloResource {

    @RequestMapping(
            value = "/rest/hello/sample",
            method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE
    )
    public ResponseEntity<String> sampleGetFromServer() {
        return new ResponseEntity<>("{\"message\":\"Greetings! Directly from the server!!\"}", HttpStatus.OK);
    }

    @RequestMapping(
            value = "/rest/hello",
            method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE
    )
    public ResponseEntity<String> sampleGetFromResource() {
        return new ResponseEntity<>("{\"message\":\"Greetings! From the client resource!\"}", HttpStatus.OK);
    }

}
