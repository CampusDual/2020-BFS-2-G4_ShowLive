package com.campusdual.showlive.model.core.service;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
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
public class ConcertService implements IConcertService {

	@Autowired
	private ConcertDao concertDao;
	@Autowired
	private DefaultOntimizeDaoHelper daoHelper;

	@Override
	public EntityResult concertQuery(Map<String, Object> keyMap, List<String> attrList)
			throws OntimizeJEERuntimeException {
		
		if (keyMap.containsKey("CONCERT_ID")) {
			final int concertId = Integer.parseInt((String)keyMap.get("CONCERT_ID"));
			keyMap.put("CONCERT_ID", concertId);
		}
		
		return this.daoHelper.query(this.concertDao, keyMap, attrList, "concert_search");
	}
	
	
	@Override
	public EntityResult concertSearchQuery(Map<String, Object> keyMap, List<String> attrList) {
		final String concertName = new StringBuilder("%").append(((String) keyMap.remove("CONCERT_NAME")).replace(" ", "%")).append("%").toString();

		BasicField field = new BasicField("CONCERT_NAME");
		BasicExpression concertNameExp = new BasicExpression(field, BasicOperator.LIKE_OP, concertName);

//		keyMap.put(SQLStatementBuilder.ExtendedSQLConditionValuesProcessor.EXPRESSION_KEY, concertNameExp);
		
		if (keyMap.containsKey("GENRE_NAME")) {
			final String genreName = ((String) keyMap.remove("GENRE_NAME")).toLowerCase();

			BasicField field2 = new BasicField("GENRE_NAME");
			BasicExpression genreNameExp = new BasicExpression(field2, BasicOperator.LIKE_OP, genreName);
			concertNameExp=new BasicExpression(concertNameExp, BasicOperator.AND_OP, genreNameExp);
//			keyMap.put(SQLStatementBuilder.ExtendedSQLConditionValuesProcessor.EXPRESSION_KEY, genreNameExp);
		}
		
		if (keyMap.containsKey("STARTDATE")) {
			final Date startDate = Date.from(LocalDate.parse((String) keyMap.remove("STARTDATE"))
					.atStartOfDay(ZoneId.systemDefault()).toInstant());
			
			BasicField field3 = new BasicField("DATE");
			BasicExpression startDateExp = new BasicExpression(field3,BasicOperator.MORE_EQUAL_OP,startDate);
			
			
			final Date endDate = Date.from(LocalDate.parse((String) keyMap.remove("ENDDATE"))
					.atStartOfDay(ZoneId.systemDefault()).toInstant());
			
			BasicField field4 = new BasicField("DATE");
			BasicExpression endDateExp = new BasicExpression(field4,BasicOperator.LESS_EQUAL_OP,endDate);
				
			
			BasicExpression andDate = new BasicExpression(startDateExp,BasicOperator.AND_OP, endDateExp);
			concertNameExp=new BasicExpression(concertNameExp, BasicOperator.AND_OP, andDate);
//			if (keyMap.containsKey("GENRE_NAME")) {
//				
//				BasicExpression dateGenre = new BasicExpression(andDate,BasicOperator.AND_OP, genreNameExp);
//			}
//			*/
//			expresions.add(andDate);
		}
		
			keyMap.put(SQLStatementBuilder.ExtendedSQLConditionValuesProcessor.EXPRESSION_KEY, concertNameExp);	
//		keyMap.put(key, value)
		
		return this.daoHelper.query(this.concertDao, keyMap, attrList, "concert_search");
	}

	@Override
	public EntityResult concertInsert(Map<String, Object> attrMap) throws OntimizeJEERuntimeException {
		return this.daoHelper.insert(this.concertDao, attrMap);
	}

 @Override
 public EntityResult lastConcertQuery(Map<String, Object> keyMap, List<String> attrList)
		 throws OntimizeJEERuntimeException {	 
	 return this.daoHelper.query(this.concertDao, keyMap, attrList, "concert_last");
 }
 
 @Override
 public EntityResult mostViewConcertQuery(Map<String, Object> keyMap, List<String> attrList)
		 throws OntimizeJEERuntimeException {	 
	 return this.daoHelper.query(this.concertDao, keyMap, attrList, "concert_last");
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