

void main(){
    List<int> nums = [-50,-50,-50,-49,-49,-48,-46,-46,-46,-46,-45,-45,-45,-45,
      -44,-44,-44,-43,-43,-43,-43,-43,-43,-43,-42,-41,-41,-40,-40,-39,-38,-38,
      -38,-38,-38,-38,-36,-35,-34,-33,-32,-31,-31,-30,-29,-28,-27,-26,-26,-26,
      -25,-22,-21,-21,-21,-21,-20,-20,-19,-18,-17,-17,-17,-17,-17,-17,-17,-16,
      -16,-14,-13,-12,-11,-11,-11,-10,-9,-7,-7,-7,-5,-5,-5,-4,-4,-4,-3,-3,-3,-2
      ,-2,-1,-1,-1,-1,0,1,1,1,2,2,3,3,5,6,6,7,8,8,10,10,10,11,11,11,14,14,17,17,
      17,18,18,18,19,20,21,21,23,23,23,23,24,24,24,24,24,25,27,27,27,28,29,30,30
      ,31,32,33,34,35,36,37,37,37,37,37,38,38,38,39,39,41,41,41,41,44,44,45,45,46,
      46,46,46,46,47,47,47,47,48,48,50,50];

    int removeDuplicates(List<int> nums) {
      for(int i=0; i<nums.length;i++){
        int currentElement = nums[i];
        int counter = 1;
        int j;
        if(i>3){
           j=i-3;
        }else j=0;
        while(j<nums.length){
          if(j != i){

            if(nums[i] == nums[j] && counter<2){
              counter++;
              j++;
            }else if(nums[i] == nums[j] && nums[j] == currentElement && counter == 2 ){
              nums.removeAt(j);
              j++;
            }else if(nums[i] != nums[j] && counter == 2){
              break;
            } else if(j>i){
              break;
            } else{
              j++;
            }
          }else j++;
        }
      }
      return nums.length;
    }
    removeDuplicates(nums);
    print(nums);
}