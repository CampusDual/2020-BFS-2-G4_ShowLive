package com.campusdual.showlive.ws.core.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.campusdual.showlive.api.core.service.ILocationService;
import com.ontimize.jee.server.rest.ORestController;

@RestController
@RequestMapping("/locations")
@ComponentScan(basePackageClasses = { com.campusdual.showlive.api.core.service.ILocationService.class })
public class LocationRestControlles extends ORestController<ILocationService> {
	@Autowired
	private ILocationService locationService;

	@Override
	public ILocationService getService() {
		return this.locationService;
	}
}
