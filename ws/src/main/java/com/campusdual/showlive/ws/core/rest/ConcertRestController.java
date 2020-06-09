package com.campusdual.showlive.ws.core.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.campusdual.showlive.api.core.service.IConcertService;
import com.ontimize.jee.server.rest.ORestController;

@RestController
@RequestMapping("/concerts")
@ComponentScan(basePackageClasses = { com.campusdual.showlive.api.core.service.IConcertService.class })
public class ConcertRestController extends ORestController<IConcertService> {

 @Autowired
 private IConcertService concertService;

 @Override
 public IConcertService getService() {
  return this.concertService;
 }
}