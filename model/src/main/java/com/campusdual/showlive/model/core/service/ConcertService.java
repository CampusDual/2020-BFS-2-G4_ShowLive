package com.campusdual.showlive.model.core.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import com.campusdual.showlive.api.core.service.IConcertService;
import com.campusdual.showlive.model.core.dao.ConcertDao;
import com.ontimize.db.EntityResult;
import com.ontimize.db.SQLStatementBuilder;
import com.ontimize.db.SQLStatementBuilder.BasicExpression;
import com.ontimize.db.SQLStatementBuilder.BasicField;
import com.ontimize.db.SQLStatementBuilder.BasicOperator;
import com.ontimize.jee.common.exceptions.OntimizeJEERuntimeException;
import com.ontimize.jee.server.dao.DefaultOntimizeDaoHelper;

@Service("ConcertService")
@Lazy
public class ConcertService implements IConcertService{

 @Autowired private ConcertDao concertDao;
 @Autowired private DefaultOntimizeDaoHelper daoHelper;
 
 @Override
 public EntityResult concertQuery(Map<String, Object> keyMap, List<String> attrList)
   throws OntimizeJEERuntimeException {
  return this.daoHelper.query(this.concertDao, keyMap, attrList);
 }
 
 @Override
 public EntityResult concertSearchQuery(Map<String, Object> keyMap, List<String> attrList) {
	 final String concertName = new StringBuilder("%").append(((String)keyMap.remove("CONCERT_NAME")).replace(" ", "%")).append("%").toString();
	 
	 BasicField field = new BasicField("CONCERT_NAME");
	 BasicExpression concertNameExp = new BasicExpression(field, BasicOperator.LIKE_OP, concertName);
	 
	 keyMap.put(SQLStatementBuilder.ExtendedSQLConditionValuesProcessor.EXPRESSION_KEY,concertNameExp);
	 
	 return this.daoHelper.query(this.concertDao, keyMap, attrList, "concert_search");
 }

 @Override
 public EntityResult concertInsert(Map<String, Object> attrMap) throws OntimizeJEERuntimeException {
  return this.daoHelper.insert(this.concertDao, attrMap);
 }

 @Override
 public EntityResult concertUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap)
   throws OntimizeJEERuntimeException {
  return this.daoHelper.update(this.concertDao, attrMap, keyMap);
 }

 @Override
 public EntityResult concertDelete(Map<String, Object> keyMap) throws OntimizeJEERuntimeException {
  return this.daoHelper.delete(this.concertDao, keyMap);
 }

}