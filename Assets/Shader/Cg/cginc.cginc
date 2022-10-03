 void Func(out float4 c){
          c=float4(0,1,0,1);
        }
float Func2(float arr[3]){
          float sum=0;
          for(int i=0;i<arr.Length;i++){
            sum+=arr[i];
          }
          return sum;
        }        