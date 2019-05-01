import { Component, OnInit } from '@angular/core';
import { DbService } from '../db.service'

import { QuestionListing } from "../questionListing";
//import data from '../../assets/testQ.json';

@Component({
  selector: 'app-questions',
  templateUrl: './questions.component.html',
  styleUrls: ['./questions.component.css']
})

export class QuestionsComponent implements OnInit {

  questionsList: QuestionListing[];

  constructor(private db: DbService) { }

  ngOnInit() {
    this.db.getCategories().subscribe(categories => this.questionsList = categories);
  }

}
