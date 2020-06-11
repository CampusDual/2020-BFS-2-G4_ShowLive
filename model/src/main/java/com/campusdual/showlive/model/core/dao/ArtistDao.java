package com.campusdual.showlive.model.core.dao;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;

import com.ontimize.jee.server.dao.common.ConfigurationFile;
import com.ontimize.jee.server.dao.jdbc.OntimizeJdbcDaoSupport;

@Repository("ArtistDao")
@Lazy
@ConfigurationFile(configurationFile = "dao/ArtistDao.xml", configurationFilePlaceholder = "dao/placeholders.properties")
public class ArtistDao extends OntimizeJdbcDaoSupport{

	public static final String ATTR_CONCERT_ID = "ARTIST_ID";
	public static final String ARTIST_NAME = "NAME";
	public static final String ATTR_TWITTER_LINK = "TWITTER_LINK";
	public static final String ATTR_INSTAGRAM_LINK = "INSTAGRAM_LINK";
	public static final String ATTR_TWITCH_LINK = "TWITCH_LINK";
	public static final String ATTR_YOUTUBE_LINK = "YOUTUBE_LINK";
	public static final String ATTR_SPOTIFY_LINK = "SPOTIFY_LINK";

}
