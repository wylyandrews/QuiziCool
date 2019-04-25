import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppComponent } from './app.component';
import { HomeComponent } from './home/home.component';
import { QuestionsHeaderComponent } from './questions-header/questions-header.component';
import { AppRoutingModule } from './app-routing.module';
import { QuestionsComponent } from './questions/questions.component';
import { PlayComponent } from './play/play.component';

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    QuestionsHeaderComponent,
    QuestionsComponent,
    PlayComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
