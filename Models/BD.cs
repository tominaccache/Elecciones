using System.Data.SqlClient;
using Dapper;
namespace elecciones.Models;

public static class BD
{
    private static string _connectionString = "Server=localhost; DataBase=elecciones;Trusted_Connection=True;";
    
    public static void AgregarCandidato(Candidato Can){

    string SQL = "INSERT INTO Candidato(IdCandidato,IdPartido,Apellido,Nombre,FechaNacimiento,Foto,Postulación) VALUES(@pIdCandidato,@pIdPartido,@pApellido,@pNombre,@pFechaNacimiento,@pFoto,@pPostulación)";
    using(SqlConnection db= new SqlConnection(_connectionString))
    {
        db.Execute(SQL, new{pIdCandidato=Can.IdCandidato,pIdPartido=Can.IdPartido,pApellido=Can.Apellido,pNombre=Can.Nombre,pFechaNacimiento=Can.FechaNacimiento,pFoto=Can.Foto,pPostulación=Can.Postulación});
    }
     }
    
    public static int EliminarCandidato(int IdCandidato){
        int RegistrosEliminados=0;
        string sql="DELETE FROM Candidato WHERE IdCandidato=@pCandidato";
        using(SqlConnection db= new SqlConnection(_connectionString))
        {
            RegistrosEliminados= db.Execute(sql, new {pCandidato = IdCandidato});
        }
        return RegistrosEliminados;
    }

    public static Partido VerInfoPartido(int idPartido){
        Partido partido = null;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "SELECT * FROM Candidato WHERE IdPartido = @pPartidoElegido";    
            partido = db.QueryFirstOrDefault(sql, new {pPartidoElegido = idPartido});
        }
        return partido;
    }

    public static Candidato VerInfoCandidato(int idCandidato){
        Candidato candidato = null;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "SELECT * FROM Candidato WHERE IdCandidato = @pCandidatoElegido";    
            candidato = db.QueryFirstOrDefault(sql, new {pCandidatoElegido = idCandidato});
        }
        return candidato;
    }

    public static List<Partido> ListarPartidos(){
        List<Partido> partidos = new List<Partido>();
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "SELECT Nombre FROM Partido";    
            partidos = db.Query<Partido>(sql).ToList();
        }
        return partidos;
    }

    public static List<Candidato> ListarCandidatos(int IdPartido){
        List<Candidato> candidatos = new List<Candidato>();
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "SELECT * FROM Candidato WHERE IdPartido = @ElegirPartido";    
            candidatos = db.Query<Candidato>(sql, new {ElegirPartido = IdPartido}).ToList();
        }
        return candidatos;
    }

}
    
