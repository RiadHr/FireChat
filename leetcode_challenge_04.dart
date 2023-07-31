void main(){
  List<int>nums = [1,2];

  void rotate(List<int> nums, int k) {
    int j=nums.length-1;
    List<int> nums2 = nums.sublist(nums.length-k);

    for(int i=nums.length-k-1;i>=0;i--){
      nums[j]=nums[i];
      j--;
    }

    for(int i=0;i<nums2.length;i++){
      nums[i]=nums2[i];
    }
  }
  rotate(nums, 3);
  print(nums);
}