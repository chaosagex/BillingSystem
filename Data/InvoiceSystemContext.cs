using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using BillingSystem.Models;

namespace BillingSystem.Data
{
    public partial class InvoiceSystemContext : DbContext
    {
        public InvoiceSystemContext()
        {
        }

        public InvoiceSystemContext(DbContextOptions<InvoiceSystemContext> options)
            : base(options)
        {
        }

        public virtual DbSet<InvoicePayment> InvoicePayments { get; set; } = null!;
        public virtual DbSet<PaymentDetail> PaymentDetails { get; set; } = null!;
        public virtual DbSet<School> Schools { get; set; } = null!;
        public virtual DbSet<Student> Students { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("server=.\\sqlexpress;database=Invoice System;Trusted_connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<InvoicePayment>(entity =>
            {
                entity.ToTable("invoice_payment");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Date)
                    .HasColumnType("date")
                    .HasColumnName("date");

                entity.Property(e => e.Notes).HasMaxLength(500);

                entity.Property(e => e.Paid)
                    .HasColumnType("money")
                    .HasColumnName("paid");

                entity.Property(e => e.PreviousPayment).HasColumnName("previous_payment");

                entity.Property(e => e.Remaining)
                    .HasColumnType("money")
                    .HasColumnName("remaining");

                entity.Property(e => e.Student).HasColumnName("student");

                entity.Property(e => e.TotalCost)
                    .HasColumnType("money")
                    .HasColumnName("total_cost");

                entity.HasOne(d => d.PreviousPaymentNavigation)
                    .WithMany(p => p.InversePreviousPaymentNavigation)
                    .HasForeignKey(d => d.PreviousPayment)
                    .HasConstraintName("FK_invoice_payment_invoice_payment");

                entity.HasOne(d => d.StudentNavigation)
                    .WithMany(p => p.InvoicePayments)
                    .HasForeignKey(d => d.Student)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_invoice_payment_student");

                entity.HasMany(d => d.PaymentItems)
                    .WithMany(p => p.Invoices)
                    .UsingEntity<Dictionary<string, object>>(
                        "InvoiceItem",
                        l => l.HasOne<PaymentDetail>().WithMany().HasForeignKey("PaymentItem").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("FK_invoice_item_payment_details"),
                        r => r.HasOne<InvoicePayment>().WithMany().HasForeignKey("Invoice").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("FK_invoice_item_invoice_payment"),
                        j =>
                        {
                            j.HasKey("Invoice", "PaymentItem");

                            j.ToTable("invoice_item");

                            j.IndexerProperty<long>("Invoice").HasColumnName("invoice");

                            j.IndexerProperty<long>("PaymentItem").HasColumnName("payment_item");
                        });
            });

            modelBuilder.Entity<PaymentDetail>(entity =>
            {
                entity.ToTable("payment_details");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Amount)
                    .HasColumnType("money")
                    .HasColumnName("amount");

                entity.Property(e => e.Name)
                    .HasMaxLength(200)
                    .IsUnicode(false)
                    .HasColumnName("name");

                entity.Property(e => e.School).HasColumnName("school");

                entity.Property(e => e.StudentType).HasColumnName("student_type");

                entity.Property(e => e.Type).HasColumnName("type");

                entity.Property(e => e.Year)
                    .HasMaxLength(9)
                    .IsUnicode(false)
                    .HasColumnName("year")
                    .IsFixedLength();

                entity.HasOne(d => d.SchoolNavigation)
                    .WithMany(p => p.PaymentDetails)
                    .HasForeignKey(d => d.School)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_payment_details_school");
            });

            modelBuilder.Entity<School>(entity =>
            {
                entity.ToTable("school");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Name)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("name");
            });

            modelBuilder.Entity<Student>(entity =>
            {
                entity.ToTable("student");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Grade).HasColumnName("grade");

                entity.Property(e => e.Name)
                    .HasMaxLength(200)
                    .HasColumnName("name");

                entity.Property(e => e.School).HasColumnName("school");

                entity.Property(e => e.Type).HasColumnName("type");

                entity.HasOne(d => d.SchoolNavigation)
                    .WithMany(p => p.Students)
                    .HasForeignKey(d => d.School)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_student_school");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
