describe("Homepage tests", () => {
  it("directs the user to the homepage", () => {
    cy.visit("/");
  });
  it("displays products on the homepage", () => {
    cy.get(".products article").should("be.visible");
  });
  it("displays 2 products on the homepage", () => {
    cy.get(".products article").should("have.length", 2);
  });
});
