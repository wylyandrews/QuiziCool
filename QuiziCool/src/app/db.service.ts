import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams, HttpResponse } from '@angular/common/http'
import { Observable, of} from 'rxjs';

import { QuestionListing } from './questionListing';
import { Question } from './question';
import { Score } from './score';

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
    return this.http.get<Question>(this.baseUrl + `addquestion.php?content=${question.content}&answer=${question.answer}&category=${question.category}&difficulty=${question.score}`);
  }

  getScores(categoryid: number): Observable<Score[]> {
    return this.http.get<Score[]>(this.baseUrl + 'getscores.php?categoryid='+categoryid);
  }

  getQuestions(categoryid: number): Observable<Question[]> {
    return this.http.get<Question[]>(this.baseUrl + 'getquestions.php?categoryid='+categoryid);
  }

}