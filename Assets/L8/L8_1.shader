Shader "Custom/L8_1"
{
    SubShader
    {
        Tags { "RenderType"="Opaque"}
        ColorMask RGB
        //ZTest Always //Always Less Greater
        //ZWrite Off
        
        pass{
            Stencil {
                Ref 1
                Comp Equal
            }
        CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            
            struct appdata{
                float4 vertex : POSITION;
            };
            struct v2f{
                float4 pos : SV_POSITION;
            };
            v2f vert(appdata v){
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                return o;
            }
            half4 frag(v2f i) : SV_Target{
                return half4(0,0,1,1);
            }
        
        ENDCG
        }
    }
}
