import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http'
import { Observable, of} from 'rxjs';

import { QuestionListing } from './questionListing';

@Injectable({
  providedIn: 'root'
})
export class DbService {

  readonly baseUrl = "https://students.cs.ndsu.nodak.edu/~dacolema/quizicool/"

  constructor(private http: HttpClient) { }

  getCategories(): Observable<QuestionListing[]> {
    return this.http.get<QuestionListing[]>(this.baseUrl + 'getcategories.php');
  }
}
