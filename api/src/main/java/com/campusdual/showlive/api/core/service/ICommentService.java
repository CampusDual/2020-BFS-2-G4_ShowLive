package com.campusdual.showlive.api.core.service;

import java.util.List;
import java.util.Map;

import com.ontimize.db.EntityResult;
import com.ontimize.jee.common.exceptions.OntimizeJEERuntimeException;

public interface ICommentService {

 // COMMENTS
 public EntityResult commentQuery(Map<String, Object> keyMap, List<String> attrList) throws OntimizeJEERuntimeException;
 public EntityResult commentInsert(Map<String, Object> attrMap) throws OntimizeJEERuntimeException;
 public EntityResult commentUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap) throws OntimizeJEERuntimeException;
 public EntityResult commentDelete(Map<String, Object> keyMap) throws OntimizeJEERuntimeException;
 public EntityResult commentSearchQuery(Map<String, Object> keyMap, List<String> attrList) throws OntimizeJEERuntimeException;

}