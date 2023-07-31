
void main(){
  int majorityElement(List<int> nums) {
    Map<int,int>occurrenceMap={};
    int currentElement;
    int counter;
    int j;

    for(int i=0 ; i<nums.length;i++){
      currentElement = nums[i];
      if(i == 0){
        j=i+1;
      }else j= 0;
      counter = 1;

      while(j<nums.length){
        if(currentElement == nums[j]){
          counter++;
          j++;
        }else j++;
      }

      occurrenceMap[currentElement] = counter;
    }

    int majority = 0;
    occurrenceMap.forEach((element,occurrence){
      if(occurrence > majority) majority = element;
    });

    return majority;

  }
  
  print(majorityElement([2,2,1,1,1,2,2]));
}