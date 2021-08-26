var answerOne;
var answerTwo;
var answerThree;
var answerFour;
var answerFive;
var lessonOneCompleted;
var lessonTwoCompleted;
var lessonThreeCompleted;

// $("#customFile").change(function () {
//     filename = this.files[0].name
// });

// var minutesLabel = document.getElementById("minutes");
// var secondsLabel = document.getElementById("seconds");
// var totalSeconds = 0;
// setInterval(setTime, 1000);
//
// function setTime() {
//     ++totalSeconds;
//     secondsLabel.innerHTML = pad(totalSeconds % 60);
//     minutesLabel.innerHTML = pad(parseInt(totalSeconds / 60));
// }
//
// function pad(val) {
//     var valString = val + "";
//     if (valString.length < 2) {
//         return "0" + valString;
//     } else {
//         return valString;
//     }
// }

function saveAnswerOne(id, value) {
    answerOne = value;
    console.log("Selected Answer One : " + answerOne);
}

function saveAnswerTwo(id, value) {
    answerTwo = value;
    console.log("Selected Answer Two : " + answerTwo);
}
function saveAnswerThree(id, value) {
    answerThree = value;
    console.log("Selected Answer Three : " + answerThree);
}
function saveAnswerFour(id, value) {
    answerFour = value;
    console.log("Selected Answer Four : " + answerFour);
}
function saveAnswerFive(id, value) {
    answerFive = value;
    console.log("Selected Answer Five : " + answerFive);
}

const correctAnswers = ['Operating System','1880s', 'Animation movie file', 'Field', 'Database'];
var result = document.querySelector('.result');

function createModal(totalCorrect) {
    var modalfadeDiv = document.createElement('div');
    $(modalfadeDiv).addClass("modal fade");
    modalfadeDiv.setAttribute("id","resultsModal")
    var modalDialogDiv = document.createElement('div');
    $(modalDialogDiv).addClass("modal-dialog modal-full");
    var modalContentDiv = document.createElement('div');
    $(modalContentDiv).addClass("modal-content");
    var modalHeaderDiv = document.createElement('div');
    $(modalHeaderDiv).addClass("modal-header");
    // var closeButton = document.createElement('button');
    // $(closeButton).addClass("btn-close");
    // closeButton.setAttribute("type","button");
    // closeButton.setAttribute("data-bs-dismiss","modal");
    // closeButton.setAttribute("aria-label","Close");
    // closeButton.innerHTML = "x" ;
    var modalTitleH5 = document.createElement('h5');
    modalTitleH5.innerHTML = "Chech your Results";
    $(modalHeaderDiv).append(modalTitleH5);
    // $(modalHeaderDiv).append(closeButton);
    var modalBodyDiv = document.createElement('div');
    $(modalBodyDiv).addClass("modal-body");

    // var image = document.createElement('img');
    // image.setAttribute("src","${pageContext.request.contextPath}/resources/img/textbook.png");
    // $(image).css("width","120px");
    // $(modalBodyDiv).append(image);

    var resultsH6 = document.createElement('h6');
    $(resultsH6).css("color","white");
    resultsH6.innerHTML = "Your correct answers are : " + totalCorrect + " / 5" ;

    var correctAnswersH6 = document.createElement('h6');
    $(correctAnswersH6).css("color","white");

    correctAnswersH6.innerHTML = "These are the correct answers for that Quiz : " + "<br>" + "Answer 1 : " + correctAnswers[0] + "<br>" + "Answer 2 : " + correctAnswers[1] + "<br>" + "Answer 3 : " + correctAnswers[2] + "<br>" + "Answer 4 : " + correctAnswers[3] + "<br>" + "Answer 5 : " + correctAnswers[4];

    $(modalBodyDiv).append(resultsH6);
    $(modalBodyDiv).append(correctAnswersH6);

    var modalFooterDiv = document.createElement('div');
    $(modalFooterDiv).addClass("modal-footer");
    var returnButton = document.createElement("button");
    $(returnButton).addClass("btn btn-primary");
    returnButton.setAttribute("data-dismiss","modal");
    returnButton.setAttribute("type","button");
    returnButton.setAttribute("onclick","returnToDashboard()");
    $(returnButton).css("backgroundColor","green");
    returnButton.innerHTML = "Return to Dashboard"
    $(modalFooterDiv).append(returnButton);

    $(modalContentDiv).append(modalHeaderDiv);
    $(modalContentDiv).append(modalBodyDiv);
    $(modalContentDiv).append(modalFooterDiv);

    $(modalDialogDiv).append(modalContentDiv);
    $(modalfadeDiv).append(modalDialogDiv);

    $('.wrapper').append(modalfadeDiv);

    $('#resultsModal').modal('show');
}

function validateAnswersForLessonOne() {

    var totalCorrect = 0;
    var totalAnswers = 5;
    var userAnswer = [];

    userAnswer.push(answerOne);
    userAnswer.push(answerTwo);
    userAnswer.push(answerThree);
    userAnswer.push(answerFour);
    userAnswer.push(answerFive);

    let score = 0;

    userAnswer.forEach((answer, index) =>{

        if(answer === correctAnswers[index]){
            score +=20;
            totalCorrect++;
        }
    });

    $.ajax({
        type: "GET",
        url: "./categoryOneLessonTwo?userCoins=" + score + "&lessonCompleted=" + 1,
        success: function (data, status) {
            createModal(totalCorrect);
            // $('#resultsModal').modal('show');
            // location.replace("./dashboard");
        }
    });

    // var modal = document.getElementById("myModal");
    // var labelCorrectAnswers = document.getElementById("totalCorrectAnswers").innerHTML = "Your correct answers are : " + totalCorrect + "/" + totalAnswers;
    // var labelGainedCoins = document.getElementById("gainCoins").innerHTML = "You gain : " + score + "XP points";

    var span = document.getElementsByClassName("close")[0];

    // modal.style.display = "block";
    // span.onclick = function() {
    //     modal.style.display = "none";
    // }

    // window.onclick = function(event) {
    //     if (event.target == modal) {
    //         modal.style.display = "none";
    //     }
    // }

    // scrollTo(0, 0);
    // result.classList.remove('d-none');
    // let output = 0;
    // var timer = setInterval(()=>{
    //     result.querySelector('span').textContent = `${output}%`;
    //     if(output === score){
    //         clearInterval(timer);
    //     }else{
    //         output++;
    //     }
    // }, 10)
    // console.log(score);
}

function saveLessonOneCategoryOne() {

}