//    Given an array of integer elements
//    write a function that finds the minimum value X that makes possible the following:
//    generate a new array that is sorted in strictly ascending order
//    by increasing or decreasing each of the elements of the initial array
//    with integer values in the [0, X] range.
//    original solution in Javascript by @sars at https://gist.github.com/liyu1981/8731977

public int hill(int[] array) {
    //resultRangeNumber is our result value, let's start with 0
    int resultRangeNumber = 0;

    //we will return a result out of this cycle when needed
    while (true) {

        //minValue is the minimum value that every next element should be
        //we set it to the (first element - resultRangeNumber)
        int minValue = array[0] - resultRangeNumber;

        /*
            ex. [10, 3, 15, 5] with resultRangeNumber = 1
            minValue = 10-1, that means all other elements should be bigger than 9
            we might add resultRangeNumber value to some of them but we need to make sure
            that they are always bigger than minValue
        */

        //start cycling through the rest of the array
        int j;
        //start with the second element
        for (j = 1; j < array.length; j++) {

            //every next element should be strictly bigger than the previous one
            //so increase the current minValue by 1
            minValue++;

            /*
                ex. [2, 2, 2, 2] with resultRangeNumber = 0
                minValue = 2
                j = 1, minValue = 3, we need to make sure array[1..n] >= minValue
            */

            //if the next element is bigger or the same as minValue
            if (array[j] >= minValue) {

                //extra check if the next element - resultRangeNumber
                //will be bigger than minValue

                /*
                    ex. [5, 7, 15, 11, 12] with resultRangeNumber = 5
                    minValue = 0
                    j = 1, minValue = 6, it works, increase j
                    j = 2, minValue = 7, 15 >= minValue is true
                    minValue < 15 - resultRangeNumber is true
                    so new minValue = 10
                    then no need to change elements 11 and 12 and the answer is 5
                */

                if (minValue < array[j] - resultRangeNumber) {
                    //set minValue to new minimum
                    minValue = array[j] - resultRangeNumber;
                }
            } else {
                //if the next element is smaller that minValue
                //extra check if even increasing the element by resultRangeNumber won't help

                /*
                    ex. [10, 2, 2, 2] with resultRangeNumber = 5
                    minValue = 5
                    j = 1, minValue = 6, 2 > minValue is false
                    minValue > 2+resultRangeNumber is true so this step is fine, continue
                    j = 2, minValue = 7, 2 > minValue is false
                    minValue > 2+resultRangeNumber is false
                    this resultRangeNumber won't work, we need to increase it
                 */

                if (minValue > array[j] + resultRangeNumber) {
                    //if the resultRangeNumber is not working then break the for loop
                    break;
                }
            }
        }

        //check if we reached the end without breaking
        if (j == array.length) {
            //got it!
            return resultRangeNumber;
        }

        //otherwise we need to increase resultRangeNumber by 1 and start from the beginning
        resultRangeNumber++;
    }
}