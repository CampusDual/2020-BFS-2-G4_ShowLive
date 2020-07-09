package com.campusdual.showlive.api.core.service;

import java.util.List;
import java.util.Map;

import com.ontimize.db.EntityResult;
import com.ontimize.jee.common.exceptions.OntimizeJEERuntimeException;

public interface ILocationService {
	 // Location
	 public EntityResult locationQuery(Map<String, Object> keyMap, List<String> attrList) throws OntimizeJEERuntimeException;
	 public EntityResult locationInsert(Map<String, Object> attrMap) throws OntimizeJEERuntimeException;
	 public EntityResult locationUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap) throws OntimizeJEERuntimeException;
	 public EntityResult locationDelete(Map<String, Object> keyMap) throws OntimizeJEERuntimeException;
}
