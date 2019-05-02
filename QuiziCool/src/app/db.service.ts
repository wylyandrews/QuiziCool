import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams, HttpResponse } from '@angular/common/http'
import { Observable, of} from 'rxjs';

import { QuestionListing } from './questionListing';
import { Question } from './question';

@Injectable({
  providedIn: 'root'
})
export class DbService {

  readonly baseUrl = "https://students.cs.ndsu.nodak.edu/~dacolema/quizicool/"

  constructor(private http: HttpClient) { }

  getCategories(): Observable<QuestionListing[]> {
    return this.http.get<QuestionListing[]>(this.baseUrl + 'getcategories.php');
  }

  addQuestion(question: Question): Observable<Question> {
    //var httpOptions = {
    //  headers: new HttpHeaders({ 'Content-Type': 'application/json'}),
    //  //params: new HttpParams(question)
    //};
    return this.http.post<Question>(this.baseUrl + 'addquestion.php', question, {params: <any>question});
  }

}
