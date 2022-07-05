describe("Jungle Tests", () => {
  it("directs the user to the homepage", () => {
    cy.visit("/");
  });
  it("displays products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
});
