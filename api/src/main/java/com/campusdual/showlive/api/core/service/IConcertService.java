package com.campusdual.showlive.api.core.service;

import java.util.List;
import java.util.Map;

import com.ontimize.db.EntityResult;
import com.ontimize.jee.common.exceptions.OntimizeJEERuntimeException;

public interface IConcertService {

 // CONCERT
 public EntityResult concertQuery(Map<String, Object> keyMap, List<String> attrList) throws OntimizeJEERuntimeException;
 public EntityResult concertInsert(Map<String, Object> attrMap) throws OntimizeJEERuntimeException;
 public EntityResult concertUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap) throws OntimizeJEERuntimeException;
 public EntityResult concertDelete(Map<String, Object> keyMap) throws OntimizeJEERuntimeException;
 public EntityResult concertSearchQuery(Map<String, Object> keyMap, List<String> attrList) throws OntimizeJEERuntimeException;

}
