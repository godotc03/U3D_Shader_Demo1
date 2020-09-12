using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraPE_Fog : MonoBehaviour
{
    private Camera cam;
    public Material mat;
    // Start is called before the first frame update
    void Start()
    {
        //Shader LOD 
        Shader.globalMaximumLOD = 400;
        cam = gameObject.GetComponent<Camera>();
    }

    private void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        Graphics.Blit(source, destination, mat);
    }
    private void OnPreRender()
    {

    }
}
