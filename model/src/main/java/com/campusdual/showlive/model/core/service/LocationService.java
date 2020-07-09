package com.campusdual.showlive.model.core.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import com.campusdual.showlive.api.core.service.ILocationService;
import com.campusdual.showlive.model.core.dao.LocationDao;
import com.ontimize.db.EntityResult;
import com.ontimize.jee.common.exceptions.OntimizeJEERuntimeException;
import com.ontimize.jee.server.dao.DefaultOntimizeDaoHelper;

@Service("LocationService")
@Lazy
public class LocationService implements ILocationService{
	@Autowired private LocationDao locationDao;
	 @Autowired private DefaultOntimizeDaoHelper daoHelper;
	 
	 @Override
	 public EntityResult locationQuery(Map<String, Object> keyMap, List<String> attrList)
	   throws OntimizeJEERuntimeException {
	  return this.daoHelper.query(this.locationDao, keyMap, attrList);
	 }

	 @Override
	 public EntityResult locationInsert(Map<String, Object> attrMap) throws OntimizeJEERuntimeException {
	  return this.daoHelper.insert(this.locationDao, attrMap);
	 }

	 @Override
	 public EntityResult locationUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap)
	   throws OntimizeJEERuntimeException {
	  return this.daoHelper.update(this.locationDao, attrMap, keyMap);
	 }

	 @Override
	 public EntityResult locationDelete(Map<String, Object> keyMap) throws OntimizeJEERuntimeException {
	  return this.daoHelper.delete(this.locationDao, keyMap);
	 }
}
