Shader "Custom/CgShader3"
{
    //流程控制
    SubShader
    {
        pass{
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            void vert(in float2 objPos:POSITION,out float4 col:COLOR,out float4 pos:POSITION0){
                pos=float4(objPos,0,1);
                //光栅化后颜色做差值
                if(pos.x<0&&pos.y<0){
                    //红
                    col=float4(1,0,0,1);
                }else if(pos.x<0){
                    //绿
                    col=float4(0,1,0,1);
                }
                else if(pos.y>0){
                    //蓝
                    col=float4(1,1,0,1);
                }
                else{
                    //黄
                    col=float4(0,0,1,1);
                }
                //col=pos;
            }
            void frag(inout float4 col:COLOR){
                //循环次数要小于1024次，不然会报错
            }
            ENDCG
        }
    }
  
}
