Shader "Custom/CgShader"
{
    SubShader
    {
        pass{
            CGPROGRAM
// Upgrade NOTE: excluded shader from DX11; has structs without semantics (struct v2f members f1)
#pragma exclude_renderers d3d11
// Upgrade NOTE: excluded shader from OpenGL ES 2.0 because it uses non-square matrices
#pragma exclude_renderers gles
            //顶点和片段必须都有
            #pragma vertex vert Standard
            #pragma fragment frag
            //宏定义
            #define MACROFL FL4(fl4.ab,fl3.zy);
            //类型别名
            typedef float4 FL4;

            struct v2f{
                float4 f1;
            };

            //变量 ： 语义(这个变量实际的意义)
            void vert(in float2 objPos:POSITION,out float4 pos:POSITION,out float4 col:COLOR)
            {
                //顶点程序必须处理然后输出
                //将2阶向量凑成4阶向量
                pos=float4(objPos,0,1);
                //语义不同类型相同也可以赋值
                //颜色值只能0~1所以负值只能当正值处理，负值时为0
                col=pos;
            }
            //COLOR0和COLOR等价
            void frag(inout float4 col:COLOR)
            {
                //拿到顶点程序输出的数据继续处理
                //从cvv(裁剪正方体)取出像素进行着色
                //从-1到1的范围进行着色，左-1中0右1
                //col=float4(1,0,0,1);
                
                //half 16精度浮点值
                //fixed定点数 0-256 颜色使用fixed已经足够
                fixed r=1;
                fixed g=0;
                fixed b=0;
                fixed a=1;
                bool bl=true;
                float2 fl2=float2(1,0);
                float3 fl3=float3(1,0,1);
                float4 fl4=float4(1,1,0,1);
                //xyzw等价于rgba
                float4 fl=float4(fl3.xzy,1);
                float4 fl1=MACROFL;
                //col=bl?fixed4(r,g,b,a):fl;

                float2x4 M2x4={fl4, 0,1,0,1};
                col=M2x4[0];

                float arr[4]={1,0.5,0.5,1};
                col=float4(arr[0],arr[1],arr[2],arr[3]);
                v2f v2;
                v2.f1=fl4;
            }
            ENDCG
        }
    }
}
