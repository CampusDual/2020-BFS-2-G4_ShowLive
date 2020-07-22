package com.campusdual.showlive.model.core.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import com.ontimize.db.EntityResult;
import com.campusdual.showlive.api.core.service.IArtistService;
import com.campusdual.showlive.model.core.dao.ArtistDao;
import com.ontimize.jee.common.exceptions.OntimizeJEERuntimeException;
import com.ontimize.jee.server.dao.DefaultOntimizeDaoHelper;

@Service("ArtistService")
@Lazy
public class ArtistService implements IArtistService{
	@Autowired private ArtistDao artistDao;
	 @Autowired private DefaultOntimizeDaoHelper daoHelper;
	 
	 @Override
		public EntityResult artistQuery(Map<String, Object> keyMap, List<String> attrList)
				throws OntimizeJEERuntimeException {
			
			if (keyMap.containsKey("ARTIST_ID")) {
				final int artistId = Integer.parseInt((String)keyMap.get("ARTIST_ID"));
				keyMap.put("ARTIST_ID", artistId);
			}
			
			return this.daoHelper.query(this.artistDao, keyMap, attrList, "artist_search");
		}

	 @Override
	 public EntityResult artistInsert(Map<String, Object> attrMap) throws OntimizeJEERuntimeException {
	  return this.daoHelper.insert(this.artistDao, attrMap);
	 }

	 @Override
	 public EntityResult artistUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap)
	   throws OntimizeJEERuntimeException {
	  return this.daoHelper.update(this.artistDao, attrMap, keyMap);
	 }

	 @Override
	 public EntityResult artistDelete(Map<String, Object> keyMap) throws OntimizeJEERuntimeException {
	  return this.daoHelper.delete(this.artistDao, keyMap);
	 }
}
