import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule } from '@angular/forms';

import { AppComponent } from './app.component';
import { HomeComponent } from './home/home.component';
import { QuestionsHeaderComponent } from './questions-header/questions-header.component';
import { AppRoutingModule } from './app-routing.module';
import { QuestionsComponent } from './questions/questions.component';
import { PlayComponent } from './play/play.component';
import { PlayQuestionsColumnComponent } from './play-questions-column/play-questions-column.component';
import { PlayAnswersComponent } from './play-answers/play-answers.component';
import { PlayScoreComponent } from './play-score/play-score.component';

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    QuestionsHeaderComponent,
    QuestionsComponent,
    PlayComponent,
    PlayQuestionsColumnComponent,
    PlayAnswersComponent,
    PlayScoreComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
