import { Component, OnInit } from '@angular/core';
import { DbService } from '../db.service';
import { Question } from '../question';

@Component({
  selector: 'app-questions-header',
  templateUrl: './questions-header.component.html',
  styleUrls: ['./questions-header.component.css']
})
export class QuestionsHeaderComponent implements OnInit {

  //Modal
  questionContent: string
  choiceA: string
  choiceB: string
  choiceC: string
  choiceD: string
  answer: string
  category: string
  difficulty: string
  description: string
  author: string

  constructor(private db: DbService) { }

  ngOnInit() {
  }

  saveChanges() {
    var newQuestion = new Question(this.questionContent, this.choiceA, this.choiceB, this.choiceC, this.choiceD, this.answer, this.category, Number(this.difficulty));
    this.db.addQuestion(newQuestion, this.author, this.description).subscribe(() => location.reload())
  }

}
