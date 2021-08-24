var studentSelectedGoal;

function goToDashboard() {

    var userGender,
        userCountry,
        userAge,
        userFirstname,
        userGoal;

    if ($('.genderMale').hasClass("active")) {
        userGender = "Male";
    } else {
        userGender = "Female";
    }

    userCountry = document.getElementById("country").value;
    userAge = parseInt(document.getElementById("intLimitTextBox").value);
    userFirstname = document.getElementById("intLimitTextBox2").value;
    userGoal = studentSelectedGoal;

    $.ajax({
        type: "GET",
        url: "./firstQuizAnswers?studentGender=" + userGender + "&studentCountry=" + userCountry + "&studentAge=" + userAge + "&studentName=" + userFirstname + "&studentGoal=" + userGoal,
        success: function (data, status) {
            location.replace("./dashboard");
        }
    });
}

function takeStudentSelectedGoal(id, value) {
    studentSelectedGoal = value;
    console.log("Student Selected Goal : " + studentSelectedGoal);
}