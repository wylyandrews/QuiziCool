import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { DbService } from '../db.service'

import { QuestionListing } from "../questionListing";

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

  questionsList: QuestionListing[];
  categoryid: number;
  username: string;

  constructor(private db: DbService, public router: Router) { }

  ngOnInit() {
    this.db.getCategories().subscribe(categories => this.questionsList = categories);
  }

  startQuiz() {
    this.router.navigateByUrl('/play', {state: {categoryid: this.categoryid, username: this.username}});
  }

}
