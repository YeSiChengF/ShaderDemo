Shader "Custom/CgShader2"
{

    SubShader
    {
      pass{
          CGPROGRAM
          #pragma vertex vert
          #pragma fragment frag
          void vert(in float2 objPos:POSITION,out float4 pos:POSITION,out float col:COLOR){
                pos=float4(objPos,0,1);
                col=pos;
          }
          void frag(inout float col:COLOR){
              int i=0;
              switch(i){
                  case 0:
                  col=float4(1,0,0,1);
                  break;
                  case 1:
                  col=float4(0,1,0,1);
                  break;
                  default:
                  col=float4(0,0,1,1);
                  break;
              }
          }
          ENDCG
      }
    }
}
