Shader "Custom/CgShader4"
{
    SubShader
    {
       pass{
        CGPROGRAM
        #include "/cginc.cginc"
        // void Func(out float4 c);
        // float Func2(float arr[3]);
        
        #pragma vertex my_Vertex
        void my_Vertex(in float2 objPos:POSITION,out float4 col:COLOR,out float4 pos:POSITION){
            pos=float4(objPos,0,1);
            col=pos;
        }
        #pragma fragment my_Fragement
        void my_Fragement(inout float4 col:COLOR){
          //必须先定义才能使用
          Func(col);
          float arr[]={0.5,0.5,0.5};
          col.x=Func2(arr);
        }
       
        ENDCG
       }
    }
}
