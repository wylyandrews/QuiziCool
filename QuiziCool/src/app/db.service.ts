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

  readonly baseUrl = "http://students.cs.ndsu.nodak.edu/~dacolema/quizicool/"

  constructor(private http: HttpClient) { }

  getCategories(): Observable<QuestionListing[]> {
    return this.http.get<QuestionListing[]>(this.baseUrl + 'getcategories.php');
  }

  addQuestion(question: Question, playername: string, description: string) {
    return this.http.get(this.baseUrl + `addquestion.php?
      content=${question.content}&
      answer=${question.answer}&
      category=${question.category}&
      difficulty=${question.score}&
      choiceA=${question.choiceA}&
      choiceB=${question.choiceB}&
      choiceC=${question.choiceC}&
      choiceD=${question.choiceD}&
      playername=${playername}&
      description=${description}`);
  }

  getScores(categoryid: number): Observable<Score[]> {
    return this.http.get<Score[]>(this.baseUrl + 'getscores.php?categoryid='+categoryid);
  }

  getQuestions(categoryid: number): Observable<Question[]> {
    return this.http.get<Question[]>(this.baseUrl + 'getquestions.php?categoryid='+categoryid);
  }

  addScore(username: string, categoryid: number, score: number, numcorrect: number) {
    return this.http.get(this.baseUrl + `addscore.php?username=${username}&categoryid=${categoryid}&score=${score}&numcorrect=${numcorrect}`)
  }

  deleteCategory(categoryid: number) {
    return this.http.get(this.baseUrl + `delcategory.php?categoryid=${categoryid}`);
  }

}