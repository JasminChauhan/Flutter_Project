for (let i = 1; i <= 5; i++) {
    let line = "";

    for (let j = 0; j < 5 - i; j++) {
        line += "  ";
    }

    for (let k = 5; k >= 5 - i + 1; k--) {
        line += k + "  ";
    }

    console.log(line);
}
