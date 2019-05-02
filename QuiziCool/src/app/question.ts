export class Question {
    content: string
    choiceA: string
    choiceB: string
    choiceC: string
    choiceD: string
    answer: string
    category: string
    score: number

    constructor(content: string, choiceA: string, choiceB: string, choiceC: string, choiceD: string, answer: string, category: string, score: number) {
        this.content = content;
        this.choiceA = choiceA;
        this.choiceB = choiceB;
        this.choiceC = choiceC;
        this.choiceD = choiceD;
        this.answer = answer;
        this.category = category;
        this.score = score;
    }
}