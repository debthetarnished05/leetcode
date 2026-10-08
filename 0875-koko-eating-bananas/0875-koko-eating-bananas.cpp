class Solution {
public:
    int minEatingSpeed(vector<int>& piles, int h) {
        int high=0,ans=0;
        for(int i =0; i<piles.size();i++){
            high=max(high,piles[i]);
        }
        
        int low=1;
        while(low<=high){
            int mid=low+(high-low)/2;
            cout<<mid<<endl;
            int hours=0;
            for(int i=0;i<piles.size();i++){
                hours+=piles[i]/mid+(piles[i]%mid!=0?1:0);
                if(hours>h)break;
            }
            if(hours>h)low=mid+1;
            else {
                ans=mid;
                high=mid-1;
            }

        }
        return ans;
    }
};