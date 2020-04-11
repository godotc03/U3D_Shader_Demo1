Shader "Unlit/L4"
{
    Properties
    {
        _MainTex1 ("Texture1", 2D) = "white" {}
        _MainTex2 ("Texture2", 2D) = "white" {}
        _Color ("Color", Color) = (0,0,1,1)
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                 float2 uv1 : TEXCOORD1;
                float4 vertex : SV_POSITION;
            };

            sampler2D _MainTex1;
            sampler2D _MainTex2;
            float4 _MainTex1_ST;
            float4 _MainTex2_ST;
            fixed4 _Color;

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex1); 
                o.uv1 = TRANSFORM_TEX(v.uv1, _MainTex2);  
                // SamplerTexture
                //o.uv = v.texcoord.xy*_MainTex1_ST.xy + _MainTex1_ST.zw;
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                // sample the texture
                //return fixed4(i.uv,0,0);
                fixed4 col1 = tex2D(_MainTex1, i.uv);
                fixed4 col2 = tex2D(_MainTex2, i.uv1);
                fixed4 col = col1 + col2;

                //col *= _Color;
                // + - * / min max pow sqrt
                return col;
            }
            ENDCG
        }
    }
}
