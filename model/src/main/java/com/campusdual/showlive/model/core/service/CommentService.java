package com.campusdual.showlive.model.core.service;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import com.campusdual.showlive.api.core.service.ICommentService;

import com.campusdual.showlive.model.core.dao.CommentDao;

import com.ontimize.db.EntityResult;
import com.ontimize.db.SQLStatementBuilder;
import com.ontimize.db.SQLStatementBuilder.BasicExpression;
import com.ontimize.db.SQLStatementBuilder.BasicField;
import com.ontimize.db.SQLStatementBuilder.BasicOperator;
import com.ontimize.jee.common.exceptions.OntimizeJEERuntimeException;
import com.ontimize.jee.server.dao.DefaultOntimizeDaoHelper;

@Service("CommentService")
@Lazy
public class CommentService implements ICommentService {

	@Autowired
	private CommentDao commentDao;
	@Autowired
	private DefaultOntimizeDaoHelper daoHelper;

	@Override
	public EntityResult commentQuery(Map<String, Object> keyMap, List<String> attrList)
			throws OntimizeJEERuntimeException {

		if (keyMap.containsKey("CONCERT_ID")) {
			final int concertId = Integer.parseInt((String) keyMap.get("CONCERT_ID"));
			keyMap.put("CONCERT_ID", concertId);
		}

		return this.daoHelper.query(this.commentDao, keyMap, attrList, "concert_comments");
	}

	@Override
	public EntityResult commentInsert(Map<String, Object> attrMap) throws OntimizeJEERuntimeException {
		Map<String, Object> attrMapLowerCase = attrMap.entrySet().stream()
				.collect(Collectors.toMap(entry -> entry.getKey().toLowerCase(), entry -> entry.getValue()));
		attrMapLowerCase.put(CommentDao.ATTR_DATE_COMMENT, new Date());
		return this.daoHelper.insert(this.commentDao, attrMapLowerCase);
	}

	@Override
	public EntityResult commentUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap)
			throws OntimizeJEERuntimeException {
		return this.daoHelper.update(this.commentDao, attrMap, keyMap);
	}

	@Override
	public EntityResult commentDelete(Map<String, Object> keyMap) throws OntimizeJEERuntimeException {
		return this.daoHelper.delete(this.commentDao, keyMap);
	}

	@Override
	public EntityResult commentSearchQuery(Map<String, Object> keyMap, List<String> attrList)
			throws OntimizeJEERuntimeException {
		// TODO Auto-generated method stub
		return null;
	}

}