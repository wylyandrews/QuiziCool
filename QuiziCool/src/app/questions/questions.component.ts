import { Component, OnInit } from '@angular/core';

import { QuestionListing } from "../questionListing";
import data from '../../assets/testQ.json';

@Component({
  selector: 'app-questions',
  templateUrl: './questions.component.html',
  styleUrls: ['./questions.component.css']
})

export class QuestionsComponent implements OnInit {

  questionsList: QuestionListing[] = data;

  constructor() { }

  ngOnInit() {
  }

}
