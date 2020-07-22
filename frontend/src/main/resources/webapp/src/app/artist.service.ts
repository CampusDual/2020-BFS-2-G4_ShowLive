import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Concert } from './concert';
import { Artist } from './artist';


@Injectable({ providedIn: 'root' })
export class ArtistService {
 

    constructor(private http: HttpClient) {
    }
    getArtistsDetail(parameters) {
        const httpOptions = { headers: new HttpHeaders({ 'Access-Control-Allow-Origin': '*', 'Content-Type': 'application/json;charset=UTF-8' }) };
        const body = {
            "filter": {
                "ARTIST_ID": parameters.artist_id
            },
            "columns": [
                "ARTIST_ID","ARTIST_NAME","GENRE_NAME","TWITTER_LINK","INSTAGRAM_LINK","TWITCH_LINK","YOUTUBE_LINK","SPOTIFY_LINK"
            ]
        };
        return this.http.post('http://localhost:33333/artists/artist/search', JSON.stringify(body), httpOptions);
    }
}