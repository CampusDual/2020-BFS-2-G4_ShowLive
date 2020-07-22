import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Comment } from './concertComment';
import { PARAMETERS } from '@angular/core/src/util/decorators';


@Injectable({ providedIn: 'root' })
export class CommentService {

    constructor(private http: HttpClient) {

    }

    getComments(parameters) {
        const httpOptions = { headers: new HttpHeaders({ 'Access-Control-Allow-Origin': '*', 'Content-Type': 'application/json;charset=UTF-8' }) };
        //console.log(parameters)
        const body = {
            "filter": {
                "CONCERT_ID": parameters.concert_id
            },
            "columns": [
                "NAME_COMMENT", "DATE_COMMENT", "CONTENT"
            ]
        };
        return this.http.post<Comment[]>('http://localhost:33333/comments/currentConcerts', JSON.stringify(body), httpOptions);
    }

    insertComments(parameters) {
        const httpOptions = { headers: new HttpHeaders({ 'Access-Control-Allow-Origin': '*', 'Content-Type': 'application/json;charset=UTF-8' }) };
        //console.log(parameters)
        const body = {
            "data": {
                "CONCERT_ID": parameters.concert_id,
                "NAME_COMMENT": "Hello",
                "DATE_COMMENT": parameters.DATE_COMMENT,
                "CONTENT": parameters.CONTENT
            },
            "sqltypes": {
                "comments_id": 4,
                "concert_id": 4,
                "name_comment": 12,
                "content": 12,
                "date_comment": 91
            }
        }
        return this.http.post<Comment[]>('http://localhost:33333/comments/currentConcerts', JSON.stringify(body), httpOptions);
    }


}