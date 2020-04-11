// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Unlit/L1_Unlit"
{
	Properties
	{
		_Color("Color", Color) = (0,1,0,1)
		_WindFrequency("WindFrequency", Range(0.01,10)) = 1
		_WindAmplitude("WindAmplitude",Range(0,0.5)) = 1
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100
		Cull Off

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            // make fog work
            #pragma multi_compile_fog

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                UNITY_FOG_COORDS(1)
                float4 vertex : SV_POSITION;
            };

            float4 _Color;
			float _WindFrequency;
			float _WindAmplitude;

            v2f vert (appdata v)
            {
                v2f o;
				//o.vertex = UnityObjectToClipPos(v.vertex);
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.vertex.xyz += _SinTime.y * float3(1, 0, 0) * (1.0 - v.uv.x);
				//o.vertex.xyz += _WindAmplitude * sin(_Time.y * _WindFrequency) * float3(1, 0, 0.2) * (1-float3(v.uv,0.0));
                return o;
            }

			fixed4 frag(v2f i) : SV_Target
			{
				// sample the texture
				fixed4 col = _Color;
                // apply fog
                UNITY_APPLY_FOG(i.fogCoord, col);
                return col;
            }
            ENDCG
        }
    }
}
