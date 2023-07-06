using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using elecciones.Models;

namespace elecciones.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    ///este index viene por default
    public IActionResult Index()
    {
        ViewBag.listpartidos=BD.ListarPartidos();
        return View();
    }
///a la viewbag la pudo llamar como yo quiera
    public IActionResult VerDetallePartido(int idPartido)
    {
        ViewBag.DatosPartido=BD.VerInfoPartido(idPartido);
        ViewBag.CandidatosPartido=BD.ListarCandidatos(idPartido);
        return View("VerDetallePartido");
    }
public IActionResult VerDetalleCandidato(int idCandidato)
    {
        ViewBag.DetalleCandidato=BD.VerInfoCandidato(idCandidato);
        return View("DetalleCandidato");
    }

public IActionResult AgregarCandidato(int idPartido)
    {
        ViewBag.DetalleCandidato=idPartido;
        return View("FormularioCandidatos");
    }


   [HttpPost] public IActionResult GuardarCandidato(Candidato can)
  {
    BD.AgregarCandidato(can);
    ViewBag.DatosPartido=BD.VerInfoPartido(can.IdPartido);
    ViewBag.CandidatosPartido=BD.ListarCandidatos(can.IdPartido);
    return View("VerDetallePartido");
  }


public IActionResult EliminarCandidato(int idCandidato, int idPartido)
  {
    BD.EliminarCandidato(idCandidato);
    ViewBag.DatosPartido=BD.VerInfoPartido(idPartido);
    return View("VerDetallePartido");
  }


public IActionResult Elecciones()
    {
        return View();
    }
    public IActionResult Creditos()
    {
        return View();
    }
    

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }



   
}
