using System.Reflection;
using Fivet.ZeroIce.model;
using Microsoft.EntityFrameworkCore;

namespace Fivet.Dao
{
    ///  <summary>
    ///  The Connection to the FivetDatabase
    ///  <summary>
    public class FivetContext : DbContext
    {
        /// <summary>
        /// The Connection to the database
        /// <summary>
        /// <value></value>
        public DbSet<Persona> Personas { get; set;}

        /// <summary>
        /// Configuration.
        /// </summary>
        /// <param name="optionBuilder"></param>
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            //  Using SQLite
            optionsBuilder.UseSqlite("Data Source=fivet.db", options =>
            {
                options.MigrationsAssembly(Assembly.GetExecutingAssembly().FullName);
            });
            base.OnConfiguring(optionsBuilder);
        }

        /// <summary>
        /// Create the ER from Entity.
        /// </summary>
        /// <param name="modelBuilder">to use</param>
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            //  Update the Model
            modelBuilder.Entity<Persona>(p =>
            {
                //  Primary Key
                p.HasKey(p => p.uid);
                //  Index in Email
                p.Property(p => p.email).IsRequired();
                p.HasIndex(p => p.email).IsUnique();
            });

            //  Insert the data
            modelBuilder.Entity<Persona>().HasData(
                new Persona()
                {
                    uid = 1,
                    nombre = "Gonzalo",
                    apellido = "Nieto",
                    direccion = "Angamos #8610",
                    email = "gnb001@alumnos.ucn.cl"
                }
            );
        }
    }
}