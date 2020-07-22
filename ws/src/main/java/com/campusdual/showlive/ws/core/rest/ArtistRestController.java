package com.campusdual.showlive.ws.core.rest;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.campusdual.showlive.api.core.service.IArtistService;
import com.ontimize.db.EntityResult;
import com.ontimize.jee.server.rest.ORestController;

@RestController
@RequestMapping("/artists")
@ComponentScan(basePackageClasses = { com.campusdual.showlive.api.core.service.IArtistService.class })
@CrossOrigin(origins = "http://localhost:4299")
public class ArtistRestController extends ORestController<IArtistService> {

	@Autowired
	private IArtistService artistService;

	@Override
	public IArtistService getService() {
		return this.artistService;
	}

	@RequestMapping(value = "/currentArtists", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public EntityResult currentArtistsSearch(@RequestBody Map<String, Object> req) {
/*
		final Map<String, Object> keysValues = new HashMap<String, Object>();

		((LinkedHashMap<String, Object>) req.get("filter")).entrySet().stream()
				.forEach(filter -> keysValues.put(filter.getKey(), filter.getValue()));

		List<String> columns = (List<String>) req.get("columns");
		Map<String, Object> key = new HashMap<String, Object>();

		return artistService.artistQuery(keysValues, columns);*/
		return new EntityResult();

	}
}