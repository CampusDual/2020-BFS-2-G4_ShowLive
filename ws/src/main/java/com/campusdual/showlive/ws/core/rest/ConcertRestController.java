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

import com.campusdual.showlive.api.core.service.IConcertService;
import com.ontimize.db.EntityResult;
import com.ontimize.jee.server.rest.ORestController;

@RestController
@RequestMapping("/concerts")
@ComponentScan(basePackageClasses = { com.campusdual.showlive.api.core.service.IConcertService.class })
@CrossOrigin(origins = "http://localhost:4299")
public class ConcertRestController extends ORestController<IConcertService> {

	@Autowired
	private IConcertService concertService;

	@Override
	public IConcertService getService() {
		return this.concertService;
	}
	
	@RequestMapping(value = "/currentConcerts", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public EntityResult currentConcertsSearch(@RequestBody Map<String, Object> req) {

		final Map<String, Object> keysValues = new HashMap<String, Object>();

		((LinkedHashMap<String, Object>) req.get("filter")).entrySet().stream()
				.forEach(filter -> keysValues.put(filter.getKey(), filter.getValue()));

		List<String> columns = (List<String>) req.get("columns");
		Map<String, Object> key = new HashMap<String, Object>();

		return concertService.concertQuery(keysValues, columns);

	}
	
//	@RequestMapping(value = "/currentComments/search", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
//	public EntityResult currentComments(@RequestBody Map<String, Object> req) {
//		
//		final Map<String, Object> keysValues = new HashMap<String, Object>();
//
//		((LinkedHashMap<String, Object>) req.get("filter")).entrySet().stream()
//				.forEach(filter -> keysValues.put(filter.getKey(), filter.getValue()));
//
//		List<String> columns = (List<String>) req.get("columns");
//		Map<String, Object> key = new HashMap<String, Object>();
//
//		return concertService.commentsQuery(keysValues, columns);
//
//	}
	
	@RequestMapping(value = "/concertSearch", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public EntityResult concertSearch(@RequestBody Map<String, Object> req) {
		Map<String, Object> keysValues = (Map<String, Object>) req.get("filter");
		
		if (keysValues.containsKey("CONCERT_ID")) {
			final int concertId = Integer.parseInt((String)keysValues.get("CONCERT_ID"));
			keysValues.put("CONCERT_ID", concertId);
		}

		List<String> columns = (List<String>) req.get("columns");
		Map<String, Object> key = new HashMap<String, Object>();

		return concertService.concertSearchQuery(keysValues, columns);
	}
	
	@RequestMapping(value = "/lastConcert", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public EntityResult lastConcert(@RequestBody Map<String, Object> req) {
		final Map<String, Object> keysValues = new HashMap<String, Object>();

		((LinkedHashMap<String, Object>) req.get("filter")).entrySet().stream()
		.forEach(filter -> keysValues.put(filter.getKey(), filter.getValue()));

		List<String> columns = (List<String>) req.get("columns");
		Map<String, Object> key = new HashMap<String, Object>();

		return concertService.lastConcertQuery(keysValues, columns);
	}
	
	@RequestMapping(value = "/mostViewConcert", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public EntityResult mostViewConcert(@RequestBody Map<String, Object> req) {
		final Map<String, Object> keysValues = new HashMap<String, Object>();

		((LinkedHashMap<String, Object>) req.get("filter")).entrySet().stream()
		.forEach(filter -> keysValues.put(filter.getKey(), filter.getValue()));

		List<String> columns = (List<String>) req.get("columns");
		Map<String, Object> key = new HashMap<String, Object>();

		return concertService.lastConcertQuery(keysValues, columns);
	}
}