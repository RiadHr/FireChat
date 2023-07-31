void main() {
  List<int> nums1 = [0,0,0,0,0];
  List<int> nums2 = [1,2,3,4,5];

  void merge(List<int> nums1, int m, List<int> nums2, int n) {
    for (int j = 0; j < n; j++) {
      for (int i = 0; i < m + n; i++) {

        if (nums2[j] < nums1[i]) {
          for (int k = m + n - 1; k > i; k--) {
            nums1[k] = nums1[k - 1];
            print('nums1[$k] = ${nums1[k]}');
          }
          nums1[i] = nums2[j];
          print('condition1 nums1[$i] = ${nums1[i]}');
          break;
        }

        else if(nums1[i]==0 && i>=n-1 && n>m){
          nums1[i] = nums2[j];
          break;
        }

        else if(nums1[i]==0 && n==m ){
          nums1[i] = nums2[j];
          break;
        }

      }
    }
  }

  merge(nums1, 0, nums2, 5);
  for(int i= 0 ;i<nums1.length;i++){
    print('nums1[$i] = ${nums1[i]}');
  }
}
