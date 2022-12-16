package org.pvs.k8sistiopetproject.controllers;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("hello-world")
@Slf4j
public class HelloWorldController {

    @GetMapping(path = "/hello")
    public String hello() {
        var hello = "Hello world! Success!";
        log.info(hello);
        return hello;
    }
}
