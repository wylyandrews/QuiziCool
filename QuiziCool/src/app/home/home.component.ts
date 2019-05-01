import { Component, OnInit } from '@angular/core';
import { DbService } from '../db.service'

import { QuestionListing } from "../questionListing";

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

  questionsList: QuestionListing[];

  constructor(private db: DbService) { }

  ngOnInit() {
    this.db.getCategories().subscribe(categories => this.questionsList = categories);
  }

}
